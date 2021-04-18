class EntriesController < ApplicationController

    get "/entries" do
        if logged_in?
        @entries = Entry.all
        @total = @entries.map {|ent| ent.amount}.sum
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

    get "/entries/september" do
        @entries = Entry.all
        @september_entries = @entries.filter {|ent| ent.month=="september"}
        @september_total = @september_entries.map {|ent| ent.amount}.sum
        erb :"entries/september"
    end
    get "/entries/january" do
        @entries = Entry.all
        @january_entries = @entries.filter {|ent| ent.month=="january"}
        @january_total = @january_entries.map {|ent| ent.amount}.sum
        erb :"/sentries/january"
    end
    

    get "/entries/:id" do
        @entry = Entry.find_by_id(params[:id])
        erb :"entries/show"
    end

    post "/entries" do
        entry = Entry.new(params)
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