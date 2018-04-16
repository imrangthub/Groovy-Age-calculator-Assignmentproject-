package assignmentproject

class Registration {
    String name
    String roll
    String birthday

    static constraints = {
        name blank: false, nullable: false
        roll blank: false, nullable: false, unique: true
        birthday blank: false, nullable: false
    }
}
