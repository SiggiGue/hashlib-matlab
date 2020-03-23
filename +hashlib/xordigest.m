function digest = xordigest(digest1, digest2)
    % XORDIGEST Returns digest by xoring two given digests.
    %
    % Parameters:
    %   digest1, digest2 ... MessageDigest.digest 
    %     Digests of java.security.MessageDigest instance.
    %
    % Returns:
    %   digest ... uint8 vector
    digest = bitxor(typecast(digest1, 'uint8'), typecast(digest2, 'uint8'));