function md = get_message_digest_instance(algo)
    % get_message_digest_instance Returns java.security.MessageDigest instance for given algo.
    %
    % Parameters:
    %   algo ... char
    %     Hashing algorithm to be used 
    %     (available algorithms can be retrieved by hashlib.algorithms())
    %
    % Returns:
    %   md ... MessageDigest$Delegate
    %       Java instance of message digest.
    md = javaMethod ('getInstance', 'java.security.MessageDigest', algo);
end