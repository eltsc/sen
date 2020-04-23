import argparse
import re
import subprocess

parser = argparse.ArgumentParser(
    description='Script for test loading various servers')

parser.add_argument('-t',
                    '--type',
                    choices=['NGINX', 'MYSQL'],
                    type=str.upper,
                    required=True,
                    help='Which kind of stress test to use')
                    
parser.add_argument(
    '--host',
    required=True,
)
parser.add_argument('-c', '--concurrency', default=1, type=int)
parser.add_argument('-i', '--iterations', default=1, type=int)

args = parser.parse_args()

print(args)
print(args.type)
# todo run actual commands
if args.type == "MYSQL":
    pass
elif args.type == "NGINX":
    pass