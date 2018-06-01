class DashboardController < ApplicationController
    before_action :authorize
    def index
        @user = current_user
        @patient = Patient.new
        @doctor = Doctor.new
        @appointment = Appointment.new
        @doctor_data = Doctor.all.pluck(:doctor_name, :id)
        @patient_data = Patient.all.pluck(:patient_name, :id)
        @appointment_data = Appointment.all
    end
    
    def create_patient
        puts patient_params
        @patient = current_user.patients.new(patient_params)
        puts @patient.inspect
        if @patient.save
            redirect_to root_path, notice: "Patient is created"
        else
            redirect_to root_path, notice: "Patient is  not created"
        end
    end

    def create_doctor
        @doctor = current_user.doctors.new(doctor_params)
        puts @doctor.inspect
        if @doctor.save
            redirect_to root_path, notice: "doctor is created"
        else
            redirect_to root_path, notice: "doctor is  not created"
        end
    end

    def create_appointment
        @appointment = current_user.appointments.new(appointment_params)
        puts @appointment.inspect
        if @appointment.save
            redirect_to root_path, notice: "appointment is created"
        else
            redirect_to root_path, notice: "appointment is  not created"
        end
    end

    private
    def patient_params
        params.require(:patient).permit(:patient_name, :phone)
    end
    def doctor_params
        params.require(:doctor).permit(:doctor_name, :phone, :specialisation)
    end
    def appointment_params
        params.require(:appointment).permit(:doctor_id, :patient_id, :disease)
    end
end
