# The build tool has not been decided yet, and initially proceeds to the this shell.
rootDir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
databaseDir=$rootDir/database

function usage
{
	echo "usage template"
}

function build
{
	docker network inspect mewe >/dev/null 2>&1 || \
	    docker network create mewe
}

function database
{
	cd $databaseDir && docker-compose up -d
}



function down
{
	cd $databaseDir && docker-compose down -v
}

function clean
{
        down
        docker network rm mewe > /dev/null 2>&1
	rm -rf $databaseDir/user_data
	rm -rf $databaseDir/mewe_data

}

function mewe
{
	case $1 in
		build | up | frontend | backend | database | down | clean )
			cmd=$1
			shift
			$cmd $@
			;;
		*)
			usage
			exit
			;;
	esac
}

mewe $@
