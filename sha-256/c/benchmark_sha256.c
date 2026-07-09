#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define EXPORT
#include "sha256.h"

static double get_time(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec / 1e9;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "rb");
    if (!fp) { perror(argv[1]); return 1; }
    fseek(fp, 0, SEEK_END);
    long msg_len = ftell(fp);
    rewind(fp);

    unsigned char *message = malloc(msg_len);
    if (!message) { fprintf(stderr, "malloc failed\n"); fclose(fp); return 1; }
    if (fread(message, 1, msg_len, fp) != (size_t)msg_len) {
        fprintf(stderr, "fread failed\n"); free(message); fclose(fp); return 1;
    }
    fclose(fp);

    struct SHA256Context ctx;
    unsigned char digest[32];

    double start = get_time();
    SHA256_init(&ctx, 256);
    SHA256_add_data(&ctx, message, msg_len);
    SHA256_finish(&ctx, 256, digest);
    double end = get_time();

    double hash_time = end - start;
    double size_mb   = (double)msg_len / (1024.0 * 1024.0);

    printf("Message length : %ld bytes\n", msg_len);
    printf("Hash time      : %.6f sec\n",  hash_time);
    printf("Hash speed     : %.2f MB/s\n", size_mb / hash_time);
    printf("Digest         : ");
    for (int i = 0; i < 32; i++) printf("%02x", digest[i]);
    printf("\n");

    free(message);
    return 0;
}
