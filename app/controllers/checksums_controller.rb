class ChecksumsController < ApplicationController
  def new
    @checksum = Checksum.new
  end

  def create
    form = Checksum.new(checksum_params)
    if form.invalid?
      return redirect_to new_checksums_path, flash: { error: 'Input text is required' }
    end
    @checksum = ChecksumGenerator.new(input: form.text).generate
  end

  private

  def checksum_params
    params.require(:checksum).permit(:text)
  end
end
