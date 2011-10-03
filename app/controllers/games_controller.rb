class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])
    @task = Task.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    create
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    respond_to do |format|
      require "date"
      if @game = Game.create(:week => Date.commercial(DateTime.now.year, DateTime.now.cweek, d=1))
        (1..11).each do |position|
          @game.frames.create(:position => position)
        end
        @game.active_frame = @game.current_frame = @game.frames.first.id
        if @game.save
          format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
          format.xml  { render :xml => @game, :status => :created, :location => @game }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])
    @game.active_frame = params[:active_frame]
    @game.save!

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
end
