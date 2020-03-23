# Hashlib for MATLAB

Small project for hashing some data types in matlab using `java.security.MessageDigest`.

Tested with **MATLAB R2018b** and **Octave 4.0.0**


## Examples

MD5 checksum as hex char

```matlab

>> hashlib.md5hex('test')

ans =

    '98ed02262167115d0f74d2670c059472'

```

SHA256 sum as hex char

```matlab

>> hashlib.sha256hex(struct('a', 1, 'b', 'test', 'c', randn(3)))

ans =

    'bbacd6b2dee3241c80bd5229deed96d6f621a8f4e6131bf683f521481a07eced'

```

Or more general

```matlab

>> algos = hashlib.algorithms()

algos = 

  struct with fields:

    SHA_384: 'SHA-384'
    SHA_224: 'SHA-224'
    SHA_256: 'SHA-256'
        MD2: 'MD2'
        SHA: 'SHA'
    SHA_512: 'SHA-512'
        MD5: 'MD5'

>> data = struct('a', 1, 'b', 'test', 'c', randn(3));
>> digest = hashlib.datahash(data, algos.SHA_512);
>> sprintf("%.2x", digest)

ans =

    'fcc79aed83dff1fbfd2359a90f479f1e3adbed839b541019b2d3ce749f49e455d1e987078bd7c780569386acf19dad1183fde6d2e6663c4534b3a6d50f92be10'

```

for more details look into `examples/example.m`


## Package functions

```

>> help hashlib
Contents of hashlib:

algorithms                     - Returns available hashing algorithms.
datahash                       - Returns digest of data usign provided algo.
get_message_digest_instance    - Returns java.security.MessageDigest instance for given algo.
md5hex                         - Returns md5 checksum of data as hex char.
recursedatahash                - Returns digest of data usign provided javaMessageDigestInstance.
sha256hex                      - Returns sha256 checksum of data as hex char.
test                           - Run tests for hashlib.
xordigest                      - Returns digest by xoring two given digests.

```


## Supported matlab data types
    
    * struct
    * cell
    * function_handle
    * numeric
    * char
    * logical 


## Tests

Tests can be run by calling

```matlab

>> hashlib.test()
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
hashlib.test(): all tests passed successful.

```
