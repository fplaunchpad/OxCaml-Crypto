#include <stdio.h>
#include <string.h>

#define EXPORT
#include "sha256.h"

static void sha256_of_string(const unsigned char *msg, unsigned long len,
                              unsigned char *out) {
    struct SHA256Context ctx;
    SHA256_init(&ctx, 256);
    SHA256_add_data(&ctx, (unsigned char *)msg, len);
    SHA256_finish(&ctx, 256, out);
}

static void hex_of_digest(const unsigned char *d, char *hex) {
    for (int i = 0; i < 32; i++)
        sprintf(hex + i * 2, "%02x", d[i]);
    hex[64] = '\0';
}

static int test(const char *label, const char *input, const char *expected) {
    unsigned char digest[32];
    char hex[65];
    sha256_of_string((const unsigned char *)input, strlen(input), digest);
    hex_of_digest(digest, hex);
    if (strcmp(hex, expected) == 0) {
        printf("PASS  %s\n", label);
        return 1;
    }
    printf("FAIL  %s\n  got      %s\n  expected %s\n", label, hex, expected);
    return 0;
}

int main(void) {
    int ok = 1;

    /* FIPS 180-4 / NIST test vectors */
    ok &= test("SHA-256(\"\")",
               "",
               "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");

    ok &= test("SHA-256(\"abc\")",
               "abc",
               "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");

    /* FIPS 180-4 Example 2 — exercises multi-block message schedule */
    ok &= test("SHA-256(FIPS-2)",
               "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
               "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1");

    ok &= test("SHA-256(\"The quick brown fox...\")",
               "The quick brown fox jumps over the lazy dog",
               "d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592");

    printf("\n%s\n", ok ? "All RFC tests PASSED" : "SOME TESTS FAILED");
    return ok ? 0 : 1;
}
