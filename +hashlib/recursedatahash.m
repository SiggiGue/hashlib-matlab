function digest = recursedatahash(data, javaMessageDigestInstance)
    % RECURSEDATAHASH Returns digest of data using provided javaMessageDigestInstance.
    %
    % Parameters:
    %   data ... struct, cell, function_handle, datetime, duration, numeric, char, logical 
    %     Data to be hashed (common types supported).
    %   javaMessageDigestInstance ... MessageDigest$Delegate
    %     Java instance of message digest
    %
    % Returns:
    %   digest ... uint8 vector
    datainfo = strcat(class(data), sprintf('%d', size(data)));
    javaMessageDigestInstance.update(typecast(uint16(datainfo), 'uint8'));
    digest = javaMessageDigestInstance.digest;
    if isempty(data)
        return
    end
    if isstruct(data)
        elcount = numel(data);
        if elcount > 1
            for idx = 1:elcount
                digest = hashlib.xordigest(digest, hashlib.recursedatahash(data(idx), javaMessageDigestInstance));
            end
        else
            fields = sort(fieldnames(data));
            fieldcount = length(fields);
            for idx = 1:fieldcount
                digest = hashlib.xordigest(digest, hashlib.recursedatahash(data.(fields{idx}), javaMessageDigestInstance));
            end
        end
    elseif iscell(data)
        elcount = numel(data);
        for idx = 1:elcount
            digest = hashlib.xordigest(digest, hashlib.recursedatahash(data{idx}, javaMessageDigestInstance));
        end
    elseif isa(data, 'function_handle')
        digest = hashlib.xordigest(digest, hashlib.recursedatahash(functions(data), javaMessageDigestInstance));
    elseif isnumeric(data)
        javaMessageDigestInstance.update(typecast(data(:), 'uint8'));
        digest = hashlib.xordigest(digest, javaMessageDigestInstance.digest);
    elseif ischar(data)
        javaMessageDigestInstance.update(typecast(uint16(data(:)), 'uint8'));
        digest = hashlib.xordigest(digest, javaMessageDigestInstance.digest);
    elseif islogical(data)
        javaMessageDigestInstance.update(typecast(uint8(data(:)), 'uint8'));
        digest = hashlib.xordigest(digest, javaMessageDigestInstance.digest);
    else
        error('Data of type %s is not supported.', class(data))
    end
