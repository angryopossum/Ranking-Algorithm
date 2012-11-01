#! /usr/bin/env ruby

#require "rexml/document"
require 'openssl'
require "base64"


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


def check_agrs(f)

  @f = f

  file = File.new(@f)
  doc = REXML::Document.new file
  root = doc.root

  @id = root.elements['id'].text
  @category= root.elements['category'].text
  @date = root.elements['date'].text
  i = root.elements['initiator'].text
  @is = root.elements['initiator_score'].text
  @f = root.elements['follower'].text
  @fs = root.elements['follower_score'].text
  @body = root.elements['body'].text
  @sig_i = root.elements['Signature'].elements['initiator_signature'].text
  @sig_f = root.elements['Signature'].elements['follower_signature'].text
  @sig_ca = root.elements['Signature'].elements['ca_signature'].text


  @pkey_i="../keys/private/#{i}.key"
  @pub_key_i="../keys/public/#{i}_public.key"
  @pub_key_f="../keys/public/#{@f}_public.key"
  @pub_key_ca="../keys/public/CA_public.key"

  @data = "#{@id}/#{@date}/#{@category}/#{i}/#{@f}/#{@body}"

  @check_signature_initiator = check_signature(@pub_key_i,@data,Base64.decode64(@sig_i))
  @check_signature_follower = check_signature(@pub_key_f,@data,Base64.decode64(@sig_f))
  @check_signature_ca = check_signature(@pub_key_ca,@data,Base64.decode64(@sig_ca))

if @check_signature_initiator and @check_signature_follower and @check_signature_ca then return true else return false end

end




end 
