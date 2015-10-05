class StreamsController < ApplicationController
  def create

    stream = Stream.new(stream_params)

    if stream.save
      render json: { id: stream.id }, status: 201
    else
      render json: {}, status: 422
    end
  end

  private

  def stream_params
    params.require(:stream).permit(:name)
  end

end

