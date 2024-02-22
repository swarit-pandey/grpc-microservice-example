# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: user/v1/user.proto

require 'google/protobuf'

require 'buf/validate/validate_pb'


descriptor_data = "\n\x12user/v1/user.proto\x12\x07user.v1\x1a\x1b\x62uf/validate/validate.proto\"\x89\x02\n\x04User\x12\x12\n\x04uuid\x18\x01 \x01(\tR\x04uuid\x12$\n\tfull_name\x18\x02 \x01(\tB\x07\xbaH\x04r\x02\x10\x01R\x08\x66ullName\x12\'\n\nbirth_year\x18\x03 \x01(\x03\x42\x08\xbaH\x05\"\x03 \xec\x0eR\tbirthYear\x12$\n\x06salary\x18\x04 \x01(\rB\x07\xbaH\x04*\x02 \x00H\x00R\x06salary\x88\x01\x01\x12.\n\taddresses\x18\x05 \x03(\x0b\x32\x10.user.v1.AddressR\taddresses\x12=\n\x0emarital_status\x18\x06 \x01(\x0e\x32\x16.user.v1.MaritalStatusR\rmaritalStatusB\t\n\x07_salary\"5\n\x07\x41\x64\x64ress\x12\x16\n\x06street\x18\x01 \x01(\tR\x06street\x12\x12\n\x04\x63ity\x18\x02 \x01(\tR\x04\x63ity*f\n\rMaritalStatus\x12\x1e\n\x1aMARITAL_STATUS_UNSPECIFIED\x10\x00\x12\x19\n\x15MARITAL_STATUS_SINGLE\x10\x01\x12\x1a\n\x16MARITAL_STATUS_MARRIED\x10\x02\x42\x65\n\x0b\x63om.user.v1B\tUserProtoP\x01Z\x0euser/v1;userv1\xa2\x02\x03UXX\xaa\x02\x07User.V1\xca\x02\x07User\\V1\xe2\x02\x13User\\V1\\GPBMetadata\xea\x02\x08User::V1b\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module User
  module V1
    User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("user.v1.User").msgclass
    Address = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("user.v1.Address").msgclass
    MaritalStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("user.v1.MaritalStatus").enummodule
  end
end
