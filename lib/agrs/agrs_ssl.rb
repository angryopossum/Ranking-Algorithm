#! /usr/bin/env ruby

#require "rexml/document"
require 'openssl'


class AgrsSSL

 def check_signature (pub_key,data,signature)

  digest = OpenSSL::Digest::SHA256.new
  pub_key = OpenSSL::PKey::RSA.new File.read pub_key

  return pub_key.verify(digest,signature,data)
  
 end


 def sign (pkey,data)

  digest = OpenSSL::Digest::SHA256.new
  pkey = OpenSSL::PKey::RSA.new File.read pkey

  return  pkey.sign(digest,data)

 end

end 
