### What is it?

A Vagrant configuration that starts up a PostgreSQL database in a virtual machine. This was original forked from https://github.com/jackdb/pg-app-dev-vm and modified for the purpose of creating a tutorial video series for Packt. It also includes the AdventureWorks sample database that was forked from https://github.com/lorint/AdventureWorks-for-Postgres

### Installation

First install [Vagrant] and [Virtual Box].

Then, run the following to create a new PostgreSQL app dev virtual machine:

	# Clone it locally:
    $ git clone https://github.com/weiishann/advance_postgresql_11.git

    # Enter the cloned directory:
    $ cd advance_postgresql_11


### Usage

    # Start up the virtual machine:
    $ vagrant up

    # Stop the virtual machine:
    $ vagrant halt

### What does it do?

It creates a virtual server running CentOS 7.5 with the PostgreSQL 11 Beta 2 installed. It also edits the PostgreSQL configuration files to allow network access.

Once it has started up it will print out how to access the database on the virtual machine. It will look something like this:

    $ vagrant up
    Bringing machine 'default' up with 'virtualbox' provider...
    [... truncated ...]
    Your PostgreSQL database has been setup and can be accessed on your local machine on the forwarded port (default: 15432)
      Host: localhost
      Port: 15432

    Admin access to postgres user via VM:
      vagrant ssh
      sudo su - postgres


### License

This is released under the MIT license. See the file [LICENSE](LICENSE).

[Virtual Box]: https://www.virtualbox.org/
[Vagrant]: http://www.vagrantup.com/
