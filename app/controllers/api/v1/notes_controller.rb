class Api::V1::NotesController < ApplicationController

    def index
        @notes = Note.all

        render json: @notes, status: 200 
    end 

    def show
        @note = Note.find(params[:id])

        render json: @note, status: 200
    end 

    def create
        @note = Note.new

        if @note.save
            render json: @note
        else 
            render json: @note.errors
        end 
    end 

    def update
        @note = Note.find(params[:id])

        if @note.update(note_params)
            render json: @note
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end 

    def destroy
        @note.destroy
    end

    private 

    def note_params
        params.require(:note).permit(:body)
    end 
end
