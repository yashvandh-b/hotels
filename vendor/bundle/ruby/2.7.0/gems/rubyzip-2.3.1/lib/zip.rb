require 'English'
require 'delegate'
require 'singleton'
require 'tempfile'
require 'fileutils'
require 'stringio'
require 'zlib'
require 'zip/constants'
require 'zip/dos_time'
require 'zip/ioextras'
require 'rbconfig'
require 'zip/entry'
require 'zip/extra_field'
require 'zip/entry_set'
require 'zip/central_directory'
require 'zip/file'
require 'zip/input_stream'
require 'zip/output_stream'
require 'zip/decompressor'
require 'zip/compressor'
require 'zip/null_decompressor'
require 'zip/null_compressor'
require 'zip/null_input_stream'
require 'zip/pass_thru_compressor'
require 'zip/pass_thru_decompressor'
require 'zip/crypto/decrypted_io'
require 'zip/crypto/encryption'
require 'zip/crypto/null_encryption'
require 'zip/crypto/traditional_encryption'
require 'zip/inflater'
require 'zip/deflater'
require 'zip/streamable_stream'
require 'zip/streamable_directory'
require 'zip/errors'

module Zip
  BANNER = [
    'RubyZip 3.0 is coming!',
    '**********************',
    '',
    'The public API of some Rubyzip classes has been modernized to use named',
    'parameters for optional arguments. Please check your usage of the',
    'following classes:',
    ' * `Zip::File`',
    ' * `Zip::Entry`',
    ' * `Zip::InputStream`',
    ' * `Zip::OutputStream`',
    '',
    'Please ensure that your Gemfiles and .gemspecs are suitably restrictive',
    'to avoid an unexpected breakage when 3.0 is released (e.g. ~> 2.3.0).',
    'See https://github.com/rubyzip/rubyzip for details. The Changelog also',
    'lists other enhancements and bugfixes that have been implemented since',
    'version 2.3.0.'
  ].freeze

  extend self
  attr_accessor :unicode_names,
                :on_exists_proc,
                :continue_on_exists_proc,
                :sort_entries,
                :default_compression,
                :write_zip64_support,
                :warn_invalid_date,
                :case_insensitive_match,
                :force_entry_names_encoding,
                :validate_entry_sizes

  def reset!
    warn BANNER.join("\n") unless BANNER.empty?

    @_ran_once = false
    @unicode_names = false
    @on_exists_proc = false
    @continue_on_exists_proc = false
    @sort_entries = false
    @default_compression = ::Zlib::DEFAULT_COMPRESSION
    @write_zip64_support = false
    @warn_invalid_date = true
    @case_insensitive_match = false
    @validate_entry_sizes = true
  end

  def setup
    yield self unless @_ran_once
    @_ran_once = true
  end

  reset!
end

# Copyright (C) 2002, 2003 Thomas Sondergaard
# rubyzip is free software; you can redistribute it and/or
# modify it under the terms of the ruby license.
