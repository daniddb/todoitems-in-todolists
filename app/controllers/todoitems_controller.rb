class TodoitemsController < ApplicationController
  before_action :set_todoitem, only: [:show, :edit, :update, :destroy]

  # GET /todoitems/1
  # GET /todoitems/1.json
  def show
  end

  # GET /todoitems/new
  def new
    @todolist = set_todolist
    @todoitem = @todolist.todoitems.new
  end

  # GET /todoitems/1/edit
  def edit
  end

  # POST /todoitems
  # POST /todoitems.json
  def create
    @todolist = set_todolist
    @todoitem = @todolist.todoitems.new(todoitem_params)

    respond_to do |format|
      if @todoitem.save
        format.html { redirect_to @todolist, notice: 'Todo item was successfully created.' }
        format.json { render :show, status: :created, location: @todoitem }
      else
        format.html { render :new }
        format.json { render json: @todoitem.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /todoitems/1
  # PATCH/PUT /todoitems/1.json
  def update
    respond_to do |format|
      if @todoitem.update(todoitem_params)
        format.html { redirect_to @todolist, notice: 'Todoitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @todoitem }
      else
        format.html { render :edit }
        format.json { render json: @todoitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todoitems/1
  # DELETE /todoitems/1.json
  def destroy
    @todoitem.destroy
    respond_to do |format|
      format.html { redirect_to @todolist, notice: 'Todoitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_todolist
      @todolist = Todolist.find(params[:todolist_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_todoitem    
      @todolist = Todolist.find(params[:todolist_id])
      id_item = @todolist.todoitems.find(params[:id])
      @todoitem = Todoitem.find(id_item)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoitem_params
      params.require(:todoitem).permit(:title, :item_due, :description, :completed)
    end
end
