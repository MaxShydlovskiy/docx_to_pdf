class ConversionsController < ApplicationController
  def index
  end

  def new
    @conversion = Conversion.new
  end

  def create
    conversion = Conversion.new
    conversion.file.attach(data: params[:request][:file], filename: 'conversion_file')
    conversion.save
    if conversion.save
      render jsonapi: conversion
    else
      render json: error_json('Conversion could not be created', 422), status: :unprocessable_entity
    end
  end
end
