% Create some example data
data = {'test', 1, 2, 3, 'md5hex'}

% Calculate the MD5 digest of data as hex string
md5digest = hashlib.md5hex(data)

% Calculate the SHA-256 digest of data as hex string
sha256digest = hashlib.sha256hex(data)

% Retrieve all available hashing algorithms as a struct
% so you can easily use tab completion to navigate algorithms
algos = hashlib.algorithms()

% Use the hashlib.datahash() function and the available algos to generate uint8 digests
sha256uint8digest = hashlib.datahash(data, algos.SHA_512)

md2uint8digest = hashlib.datahash(data, algos.MD2)

% Run the tests for hashlib
hashlib.test()

% Have fun!