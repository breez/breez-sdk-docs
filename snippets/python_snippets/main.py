#!/usr/bin/env python

import breez_sdk
from src.getting_started import getting_started,getting_started_node_info
from src.connecting_lsp import get_lsp_info, connect_lsp
from src.buy_btc import buy
from src.send_onchain import get_current_fees, list_current_fees, check_reverse_swap_status, start_reverse_swap
from src.static_channel_backup import retrieve_backup_files
from src.send_spontaneous_payment import send_spontaneous_payment
from src.receive_payment import receive_payment
from src.receive_onchain import generate_receive_onchain_address, get_in_progress_swap, list_refundables, execute_refund, get_channel_opening_fees
from src.fiat_currencies import list_supported_fiat_currencies, get_current_rates
from src.lnurl_auth import auth
from src.lnurl_pay import pay
from src.lnurl_withdraw import withdraw
import tempfile

import os

class SDKListener(breez_sdk.EventListener):
   def on_event(self, event):
      print(event)
 

def main():  
   temp_dir = tempfile.TemporaryDirectory()

   
   api_key = os.getenv("API_KEY")
   mnemonic = os.getenv("MNEMONIC")

   # getting started
   sdk_services =  getting_started(api_key, mnemonic, temp_dir.name)    
   node_info = getting_started_node_info(sdk_services)
   print(type(node_info))
  
   # lsp info
   get_lsp_info(sdk_services)

   # connect lsp
   connect_lsp(sdk_services,sdk_services.lsp_id())
   
   # buy btc
   buy(sdk_services)

   # send onchain
   current_fees = get_current_fees(sdk_services)
   list_current_fees(current_fees)
   check_reverse_swap_status(sdk_services)
   # start_reverse_swap(sdk_services,current_fees, 7)

   # static backup
   temp_dir2 = tempfile.TemporaryDirectory()
   retrieve_backup_files(sdk_services,temp_dir2.name)

   # receive payment
   receive_payment(sdk_services)

   # receive onchain 
   generate_receive_onchain_address(sdk_services)
   get_in_progress_swap(sdk_services)
   refundables = list_refundables(sdk_services)
   execute_refund(sdk_services,refundables)
   get_channel_opening_fees(sdk_services,3000000)

   #send spontaneous payment
   #send_spontaneous_payment(sdk_services)

   # fiat currencies
   list_supported_fiat_currencies(sdk_services)
   get_current_rates(sdk_services)

   # lnurl auth
   #auth(sdk_services)

   # lnurl pay
   #pay(sdk_services)

   # lnurl withdraw 
   #withdraw(sdk_services)



   # use temp_dir, and remove when done:
   temp_dir.cleanup()
   temp_dir2.cleanup()



main()

  
