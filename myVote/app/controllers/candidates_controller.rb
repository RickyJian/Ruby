class CandidatesController < ApplicationController
  
  before_action :find_candidate , only: [:show ,:edit ,:update , :destroy , :vote]  
  def show
    
  end
  def index
      @candidates = Candidate.all
  end 
  def new 
     @candidate = Candidate.new
  end
  
  def vote 
    log = Log.new(candidate: @candidate, ip_address: request.remote_ip)
    @candidate.logs << log
    @candidate.save
    
   ## @candidate.vote
    redirect_to candidates_path, notice: "done!";
    
    
  end
  
  def show 
    @candidate = Candidate.find_by(id: params[:id])
  end
  def create
  
     @candidate = Candidate.new(candidate_params)
     if @candidate.save
        redirect_to candidates_path , notice: "success!"
     else
       render 'new'
        #redirect_to new_candidate_path
     end
  end
  
  def edit
  #  @candidate = Candidate.find_by(id: params[:id])      
  #  redirect_to candidates_path , notice: "no data!" if  @candidate.nil? ##沒有直導回原頁面
  end
  
  def update
   # @candidate = Candidate.find_by(id: params[:id])      
   # redirect_to candidates_path , notice: "no data!" if  @candidate.nil? ##沒有直導回原頁面
     if @candidate.update (candidate_params) 
        redirect_to candidates_path , notice: "updated!"
     else
       render 'edit'
        #redirect_to new_candidate_path
     end
  end
  
  def destroy 
  #  @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    redirect_to candidates_path , notice: "deleted!"
  end
  def candidate_params 
  params.required("candidate").permit(:name , :party , :age , :politics)  # 允許欄位從前端傳到端
  end
  
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])      
    redirect_to candidates_path , notice: "no data!" if  @candidate.nil? ##沒有直導回原頁面
  end
end