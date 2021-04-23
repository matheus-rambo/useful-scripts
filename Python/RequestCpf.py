#!/usr/bin/python3

"""
    A small program to request a valid cpf and do an optional action after the request
    We use the 4devs tool to generate valid cpfs. 
    Besides the cpf is valid, it may not be from a real person.

    4Devs tool: https://www.4devs.com.br/gerador_de_cpf
    They have very useful tools.
"""

import argparse
import requests
from concurrent.futures import ThreadPoolExecutor


parser = argparse.ArgumentParser()

required = parser.add_argument_group('required arguments')
optional = parser.add_argument_group('optional arguments')

required.add_argument('-quantity',           type=int,               required=True,   dest='quantity',          help='How many cpf are need.'                        )
optional.add_argument('--callback-url',      type=str, default=None, required=False,  dest='callback_url',      help='URL to be called after the cpf is generated.'  )
optional.add_argument('--number-of-threads', type=int, default=1,    required=False,  dest='number_of_threads', help='How many threads will be used.'                )


url = "https://www.4devs.com.br/ferramentas_online.php"
payload = {
    "acao": "gerar_cpf",
    "pontuacao": "N",
    "cpf_estado": ""
}


def do_http_request() -> str: 
    return requests.post(url, data=payload).text


def main(): 

    args=parser.parse_args()

    with ThreadPoolExecutor(args.number_of_threads) as executor:
        futures = []
        for index in range(0, args.quantity):
            futures.append(executor.submit(do_http_request))
        
        for future in futures:
            print(future.result())



if __name__ == '__main__':
    main()





