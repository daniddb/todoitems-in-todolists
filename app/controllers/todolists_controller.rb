class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]

  # GET /todolists
  # GET /todolists.json
  def index
    @todolists = current_user.todolists.paginate(page: params[:page], per_page: 10)
  end

  # GET /todolists/1
  # GET /todolists/1.json
  def show
    @todolist = current_user.todolists.find(params[:id])
    @counted_todos = Todolist.joins(:todoitems).where(id: @todolist, todoitems:{completed:'t' }).count
  end

  # GET /todolists/new
  def new
    @todolist = current_user.todolists.new
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists
  # POST /todolists.json
  def create
    @todolist = current_user.todolists.new(todolist_params)

    respond_to do |format|
      if @todolist.save
        format.html { redirect_to @todolist, notice: 'Todolist was successfully created.' }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todolists/1
  # PATCH/PUT /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.html { redirect_to @todolist, notice: 'Todolist was successfully updated.' }
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.json
  def destroy
    @todolist.destroy
    respond_to do |format|
      format.html { redirect_to todolists_url, notice: 'Todolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = current_user.todolists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todolist_params
      params.require(:todolist).permit(:list_name, :list_due)
    end
end
