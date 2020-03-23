function digest = datahash(data, algo)
    % DATAHASH Returns digest of data using provided algo.
    %
    % Parameters:
    %   data ... struct, cell, function_handle, datetime, duration, numeric, char, logical 
    %     Data to be hashed (common types supported).
    %   algo ... char
    %     Hashing algorithm to be used 
    %     (available algorithms can be retrieved by hashlib.algorithms)
    %
    % Returns:
    %   digest ... uint8 vector
    md = hashlib.get_message_digest_instance(algo);
    digest = hashlib.recursedatahash(data, md);
end