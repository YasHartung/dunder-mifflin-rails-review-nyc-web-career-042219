class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def sort_dogs
        @dogs = Dog.sort_dogs
    end



    def show
        @dog = find_dog
        @owners = @dog.employees
    end

    private

    def find_dog
        Dog.find(params[:id])
    end






end
