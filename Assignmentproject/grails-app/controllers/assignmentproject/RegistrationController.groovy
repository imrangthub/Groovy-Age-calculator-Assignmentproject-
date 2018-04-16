package assignmentproject

import grails.converters.JSON
import grails.converters.*
import org.joda.time.DateTime
import org.joda.time.Days
import org.joda.time.Weeks;
import org.joda.time.format.DateTimeFormat

import java.text.SimpleDateFormat
import java.time.LocalDate
import java.time.Period
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

import org.joda.time.Years

import java.text.SimpleDateFormat
import java.time.LocalDate

class RegistrationController {

    def index() {
        def studentList = Registration.list()
        def studentFinalList = []
        String result
        for (Registration student : studentList) {
            String birthDayString = student.birthday
            LocalDate today = LocalDate.now();
            LocalDate birthDay = LocalDate.parse(birthDayString);
            Period agePeriod = Period.between(birthDay, today);

            def studentMap = [:]
            studentMap.put('id',student.id )
            studentMap.put('name',student.name )
            studentMap.put('roll',student.roll )
            studentMap.put('age', agePeriod.getYears() + " years "+agePeriod.getMonths() + "Month "+ agePeriod.getDays() + "Day")

            studentFinalList.add(studentMap)

        }
        [studentFinalList: studentFinalList]

//        result = studentFinalList as JSON
//        render result
    }

    def create(){}

    def insert(){
        if(params.name && params.roll && params.birthday){
            def registration = new Registration(params)
            if(registration.save(flush: true)){
                flash.message = "Successfully registration complete."
                redirect(action: 'index')
            }else{
                flash.error = " Registration failed. ( This roll already exist )"
                redirect (action: 'create')
            }
        }else{
            flash.error = " Registration failed"
            redirect(action: 'create')
        }
    }




    def save(params){
        if(!request.method.equals('POST')){
            println('This is not a Post method request')
            redirect(action:'index')
            return
        }

        LinkedHashMap result = new LinkedHashMap()
        String output

        if(params.name && params.roll && params.birthday){
            def registration = new Registration(params)
            if(registration.save(flush: true)){
                result.put("isError", false)
                result.put("message", "Successfully registration complete.")
                output = result as JSON
                render output
                println(params)
                return
            }else{
                result.put("isError", true)
                result.put("message", "Registration failed. ( This roll already exist )")
                output = result as JSON
                render output
                println(params)
                return
            }
        }else{
            result.put("isError", true)
            result.put("message", "Requirement field is empty.")
            output = result as JSON
            render output
            println(params)
            return
        }

    }





    def edit(Long id){
        def registration = Registration.get(id)
        [registration: registration]
    }
    def update(Long id){
        if(params.name && params.roll && params.birthday){
            Registration registration = Registration.findById(id)
            registration.name = params.name
            registration.roll = params.roll
            registration.birthday = params.birthday
            registration.save(flush: true)
            flash.message = " Successfully update your data."
            redirect(action: 'index')
        }else{
            flash.error = "Update failed."
            redirect (action: 'edit', id: id)
        }
    }
    def delete(Long id){
        Registration registration = Registration.findById(id)
        registration.delete(flush: true)
        flash.message = "Successfully deleted your date."
        redirect(action: 'index')
    }

}
