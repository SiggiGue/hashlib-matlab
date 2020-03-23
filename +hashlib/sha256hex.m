function hexdigest = sha256hex(data)
    % SHA256HEX Returns sha256 checksum of data as hex char.
    %
    % Parameters:
    %   data ... struct, cell, function_handle, datetime, duration, numeric, char, logical 
    %       Data to be hashed
    %
    % Returns:
    %   hexdigest ... char
    %       Checksum (digest) as hex char.    
    digest = hashlib.datahash(data, 'SHA-256');
    hexdigest = sprintf('%.2x', digest);
end