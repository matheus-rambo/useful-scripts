#!/usr/bin/python3

"""
    A small program that can generate a valid cpf(using web tool), or, use a user defined list of cpfs, then, call a callback url.

    For generating and using a cpf:
        We use the 4devs tool to generate valid cpfs. 
        Besides the cpf is valid, it may not be from a real person.

        4Devs tool: https://www.4devs.com.br/gerador_de_cpf
        They have very useful tools.
"""

import argparse
import requests
from concurrent.futures import ThreadPoolExecutor
import random
import functools
import datetime


parser = argparse.ArgumentParser()

required = parser.add_argument_group('required arguments')
optional = parser.add_argument_group('optional arguments')

required.add_argument('-quantity',           type=int,                 required=True,  dest='quantity',                           help='How many cpf are need.')
optional.add_argument('--callback-url',      type=str,   default=None, required=False, dest='callback_url',                       help='URL to be called after the cpf is generated.')
optional.add_argument('--number-of-threads', type=int,   default=1,    required=False, dest='number_of_threads',                  help='How many threads will be used.')
optional.add_argument('--cpf',               type=int,   default=None, required=False, dest='cpfs',              action='append', help='If you want to use this cpf')
optional.add_argument('--timeout',           type=float, default=60,   required=False, dest='timeout',                            help='Request timeout.') 

request_cpf_url = "https://www.4devs.com.br/ferramentas_online.php"
request_cpf_payload = {
    "acao": "gerar_cpf",
    "pontuacao": "N",
    "cpf_estado": ""
}

args=parser.parse_args()

def do_request() -> str: 
    cpf = None
    if args.cpfs is None:
        cpf = requests.post(request_cpf_url, data=request_cpf_payload, timeout=args.timeout).text
    else:
        index = random.randint(0, len(args.cpfs) - 1)
        cpf = str(args.cpfs[index])
    if(args.callback_url):
        url = args.callback_url.format(cpf)
        try:
            init_time = datetime.datetime.now()
            value = requests.get(url, timeout=args.timeout).text 
            end_time = datetime.datetime.now()
            return "Start time: {}, End Time. {}, Value: {}.".format(init_time.strftime('%Y-%m-%d %H:%M:%S.%f'), end_time.strftime('%Y-%m-%d %H:%M:%S.%f'), value)
        except requests.ReadTimeout:
            return "Request timeout for: {} timeout: {}".format(url, args.timeout)
    else:
        return cpf


def callback(future):
    print(future.result())

def main(): 

    init_time = datetime.datetime.now()

    with ThreadPoolExecutor(args.number_of_threads) as executor:
        for index in range(0, args.quantity):
            executor.submit(do_request).add_done_callback(callback)        
        executor.shutdown(wait=True)

    end_time = datetime.datetime.now()  
 
    print("Requests made: {}, Start time: {}, End time: {}".format(args.quantity, init_time.strftime('%Y-%m-%d %H:%M:%S'), end_time.strftime('%Y-%m-%d %H:%M:%S')))

if __name__ == '__main__':
    main()






