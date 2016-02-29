# This file is used for helping remember rails commands.

print_red() {
    echo -e "\033[31m$1\033[0m"
}

print_green() {
    echo -e "\033[32m$1\033[0m"
}

print_title() {
    print_red ""
    print_red "#########################"
    size=${#1}
    spacecount=$(((25-size-2)/2))
    title=""
    for (( i=0; i<$spacecount; i++ )); do
        title="$title "
    done
    title="$title$1"
    for (( i=0; i<$spacecount; i++ )); do
        title="$title "
    done
    if [ ${#title} -lt 23 ]; then title="$title "; fi
    print_red "#$title#"
    print_red "#########################"
}

print_command() {
    print_green "$ rails generate controller StaticPages home help"
}

print_title   'Project'
print_command '$ rails new myapp -d mysql'

print_title   'Controllers'
print_command '$ rails generate controller StaticPages home help'
print_command '$ rails destroy  controller StaticPages home help'

print_title   'Models'
print_command '$ rails generate model User name:string email:string'
print_command '$ rails destroy model User'

print_title   'Database'
print_command '$ bundle exec rake db:create'
print_command '$ bundle exec rake db:migrate'
print_command '$ bundle exec rake db:migrate:reset'
print_command '$ bundle exec rake db:rollback'
print_command '$ bundle exec rake db:migrate VERSION=0'
print_command '$ rails generate migration add_index_to_users_username'

print_title   'Testing'
print_command '$ bundle exec rake test'

echo ""

unset -f print_red
unset -f print_green
unset -f print_title
unset -f print_command
