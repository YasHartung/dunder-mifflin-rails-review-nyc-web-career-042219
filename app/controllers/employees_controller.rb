class EmployeesController < ApplicationController

    def index
        @employees = Employee.all 
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.valid?
            @employee.save

            redirect_to employee_path(@employee.id)
        else
            flash[:notice] = @employee.errors.full_messages[0]
            @dogs = Dog.all

            render :new

        end
    end

    def edit 
        @employee = find_employee
        @dogs = Dog.all
    end 
    
    def update
        @employee = find_employee
        @employee.assign_attributes(employee_params)
        if @employee.valid?
            @employee.save

            redirect_to employee_path(@employee.id)
        else
            flash[:notice] = @employee.errors.full_messages[0]
            @dogs = Dog.all

            render :edit

        end

    end
    
    
    
    def show 
        @employee = find_employee
    end

    private

    def find_employee
        Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end 
end
