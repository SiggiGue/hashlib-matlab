function hexdigest = md5hex(data)
    % MD5HEX Returns md5 checksum of data as hex char.
    %
    % Parameters:
    %   data ... struct, cell, function_handle, datetime, duration, numeric, char, logical 
    %       Data to be hashed
    %
    % Returns:
    %   hexdigest ... char
    %       Checksum (digest) as hex char.                    
    digest = hashlib.datahash(data, 'MD5');
    hexdigest = sprintf('%.2x', digest); 
end