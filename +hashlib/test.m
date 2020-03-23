function test
    % TEST Run tests for hashlib.

    algos = hashlib.algorithms();
    assert(length(struct2cell(algos)) > 0, 'No hashing algorithms available.');
    disp('.')

    algosfieldnames = fieldnames(algos);
    testst = struct( ...
        'a', 1, ...
        'b', 'teststr', ...
        'c', randn(5), ...
        'd', true, ...
        'e', struct('a', true, 'b', false), ...
        'f', {1, 2, 'ä', magic(3)}, ...
        'i', @eye);

    testc = struct2cell(testst);
    for kk = 1:length(algosfieldnames)
        algo = algos.(algosfieldnames{kk});
        digest = hashlib.datahash(testst, algo);
        assert(isa(digest, 'uint8'), 'Unexpected output of hashlib.datahas()')
        disp('.')

        digest = hashlib.datahash(testc, algo);
        assert(isa(digest, 'uint8'), 'Unexpected output of hashlib.datahas()')
        disp('.')

    end

    assert(strcmp(hashlib.md5hex('test'), '98ed02262167115d0f74d2670c059472'), ...
        'Hashes are not matching.');
    disp('.')
    assert(strcmp(hashlib.sha256hex('test'), '7cb75aec04304a37d25b9db308e49ce944c186da7b0e6f55f9f0bfbe7db4e9e2'), ...
        'Hashes are not matching.');
    disp('.')
    
    disp('hashlib.test(): all tests passed successful.')
end