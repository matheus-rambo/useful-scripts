#!/usr/bin/python3
import base64
import sys

if len(sys.argv) == 1:
    print("Usage: {} file ... fileN".format(sys.argv[0]))
else:
    for index in range(1, len(sys.argv)):
        filename = sys.argv[index].split("/")[-1]
        with open(sys.argv[index], "rb") as file:
            content = base64.b64encode(file.read())
            with open("/tmp/{}".format(filename), "wb") as write:
                write.write(content)
    print("Done ...")
