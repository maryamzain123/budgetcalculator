class EntriesController < ApplicationController

    get "/entries" do
        
        if logged_in?
            
            # binding.pry
        @entries = Entry.all
        @user_total =  current_user.entries.map {|ent| ent.amount}.sum
        erb :"entries/index" 
        else 
            redirect "/login"
        end
    end

    get "/entries/new" do
        erb :"entries/new" 
    end

    get "/entries/monthlist" do
        erb :"entries/monthlist" 
    end

    get "/entries/january" do
        @entries = Entry.all
        @january_entries = @entries.filter {|ent| ent.month=="january"}
        @january_total = @january_entries.map {|ent| ent.amount}.sum
        erb :"entries/january"
    end
    get "/entries/february" do
        @entries = Entry.all
        @february_entries = @entries.filter {|ent| ent.month=="february"}
        @february_total = @february_entries.map {|ent| ent.amount}.sum
        erb :"entries/february"
    end
    get "/entries/march" do
        @entries = Entry.all
        @march_entries = @entries.filter {|ent| ent.month=="march"}
        @march_total = @march_entries.map {|ent| ent.amount}.sum
        erb :"entries/march"
    end
    get "/entries/april" do
        @entries = Entry.all
        @april_entries = @entries.filter {|ent| ent.month=="april"}
        @april_total = @april_entries.map {|ent| ent.amount}.sum
        erb :"entries/april"
    end
    get "/entries/may" do
        @entries = Entry.all
        @may_entries = @entries.filter {|ent| ent.month=="may"}
        @may_total = @may_entries.map {|ent| ent.amount}.sum
        erb :"entries/may"
    end
    get "/entries/june" do
        @entries = Entry.all
        @june_entries = @entries.filter {|ent| ent.month=="june"}
        @june_total = @june_entries.map {|ent| ent.amount}.sum
        erb :"entries/june"
    end

    get "/entries/july" do
        @entries = Entry.all
        @july_entries = @entries.filter {|ent| ent.month=="july"}
        @july_total = @july_entries.map {|ent| ent.amount}.sum
        erb :"entries/july"
    end

    get "/entries/august" do
        @entries = Entry.all
        @august_entries = @entries.filter {|ent| ent.month=="august"}
        @august_total = @august_entries.map {|ent| ent.amount}.sum
        erb :"entries/august"
    end
    
    get "/entries/september" do
        @entries = Entry.all
        @september_entries = @entries.filter {|ent| ent.month=="september"}
        @september_total = @september_entries.map {|ent| ent.amount}.sum
        erb :"entries/september"
    end

    get "/entries/october" do
        @entries = Entry.all
        @october_entries = @entries.filter {|ent| ent.month=="october"}
        @october_total = @october_entries.map {|ent| ent.amount}.sum
        erb :"entries/october"
    end
    get "/entries/november" do
        @entries = Entry.all
        @november_entries = @entries.filter {|ent| ent.month=="november"}
        @november_total = @november_entries.map {|ent| ent.amount}.sum
        erb :"entries/november"
    end
    get "/entries/december" do
        @entries = Entry.all
        @december_entries = @entries.filter {|ent| ent.month=="december"}
        @december_total = @december_entries.map {|ent| ent.amount}.sum
        erb :"entries/december"
    end


    

    get "/entries/:id" do
        @entry = Entry.find_by_id(params[:id])
        erb :"entries/show"
    end

    post "/entries" do
        entry = Entry.new(params)
        entry.user_id = current_user.id
        if entry.save 
            redirect "entries/#{entry.id}"
        else
            redirect "entries/new"
        end

    end

    get "/entries/:id/edit" do
        if logged_in?
            @entry = Entry.find_by_id(params[:id])
            if @entry.user_id != current_user.id || @entry.user_id == nil
        erb :"entries/edit"
        else
        redirect "/login"
    end
    end
    end

    patch "/entries/:id" do
        @entry = Entry.find_by_id(params[:id])
            params.delete("_method")
        @entry.update(params)
        if @entry.update(params) 
            redirect "/entries/#{@entry.id}"
        else
            redirect "entries/new"
        end
    end

    delete "/entries/:id" do
        @entry = Entry.find_by_id(params[:id])
        @entry.destroy
        redirect "/entries"
    end
end