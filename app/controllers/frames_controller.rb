class FramesController < ApplicationController
  # GET /frames
  # GET /frames.xml
  def index
    @frames = Frame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frames }
    end
  end

  # GET /frames/1
  # GET /frames/1.xml
  def show
    @frame = Frame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frame }
    end
  end

  # GET /frames/new
  # GET /frames/new.xml
  def new
    @frame = Frame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frame }
    end
  end

  # GET /frames/1/edit
  def edit
    @frame = Frame.find(params[:id])
  end

  # POST /frames
  # POST /frames.xml
  def create
    @frame = Frame.new(params[:frame])

    respond_to do |format|
      if @frame.save
        format.html { redirect_to(@frame, :notice => 'Frame was successfully created.') }
        format.xml  { render :xml => @frame, :status => :created, :location => @frame }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /frames/1
  # PUT /frames/1.xml
  def update
    @frame = Frame.find(params[:id])
    respond_to do |format|
      if @frame.update_attributes(params[:frame])
        @game = @frame.game
        if completed?(@frame) 
          if @frame.position == 11
            #do nothing for now
          elsif @game.current_frame == @frame.id 
            @game.update_attributes(:current_frame => frameafter(@frame).id,
                                    :active_frame  => frameafter(@frame).id)
          end
        end
        rewrite_totals unless @frame.position == 11
        format.html { redirect_to(@game, :notice => 'Frame was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frames/1
  # DELETE /frames/1.xml
  def destroy
    @frame = Frame.find(params[:id])
    @frame.destroy

    respond_to do |format|
      format.html { redirect_to(frames_url) }
      format.xml  { head :ok }
    end
  end

  def clear_all
    @frames = Frame.all
    @frames.each do |frame|
      frame.ball1 = 0
      frame.ball2 = 0
      render('pages/home', :error => 'Sorry, there was a problem.') unless frame.save!
    end
    rewrite_totals
    redirect_to('/', :notice => 'Frames were successfully updated.')
  end

  def rewrite_totals
    @game = @frame.game
    runningtotal = 0
    @game.frames.each do |frame|
      break unless frame.id < @game.current_frame
      ball1 = frame.ball1.to_i
      ball2 = frame.ball2.to_i
      score = ball1 + ball2
      if ball1 == 10
        score += strikebonus(frame)
      elsif score == 10
        score += sparebonus(frame)
      end
      runningtotal += score
      frame.total = runningtotal unless frame.ball1.nil? && frame.ball2.nil?
      frame.save!
    end
  end
  def sparebonus (frame)
    nextframe = frameafter(frame)
    if nextframe.ball1 == 10
      return 10 
    else 
      return nextframe.ball1.to_i
    end
  end
  def strikebonus (frame)
    nextframe = frameafter(frame)
    if nextframe.ball1 == 10
      return 10 + sparebonus(nextframe)
    else
      return nextframe.ball1.to_i + nextframe.ball2.to_i
    end
  end
  def frameafter (frame)
    @game.frames.where(:position => frame.position + 1)[0]
  end
  def completed? (frame)
    frame.ball1 != nil && frame.ball2 != nil or
    frame.ball1 == 10
  end
end
