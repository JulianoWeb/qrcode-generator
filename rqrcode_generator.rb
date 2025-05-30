#!/usr/bin/env ruby

require 'rqrcode'
require 'chunky_png'

def gerar_qr(texto, arquivo = "qrcode.png")
  qrcode = RQRCode::QRCode.new(texto)

  png = qrcode.as_png(
    bit_depth: 1,
    border_modules: 4,
    color_mode: ChunkyPNG::COLOR_GRAYSCALE,
    color: "black",
    file: nil,
    fill: "white",
    module_px_size: 6,
    resize_exactly_to: false,
    size: 200
  )

  File.binwrite(arquivo, png.to_s)
  puts "✅ QR Code salvo como #{arquivo}!"
end

def menu
  puts "\n=== Gerador de QR Code CLI ==="
  print "Digite o texto ou link para gerar o QR Code: "
  texto = gets.chomp
  print "Digite o nome do arquivo (padrão qrcode.png): "
  arquivo = gets.chomp
  arquivo = "qrcode.png" if arquivo.strip.empty?

  gerar_qr(texto, arquivo)
end

menu
