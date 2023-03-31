# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def qr_code
    # Generate a random UUID for the QR code data
    qr_code_data = SecureRandom.uuid

    # Generate the QR code object with the data
    qr_code = RQRCode::QRCode.new(qr_code_data)

    # Render the QR code as SVG and send it as a response
    svg = qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
    send_data(svg, type: 'image/svg+xml', disposition: 'inline')
  end
end
