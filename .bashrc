# Bootstrap dev environment for go
bootstrap_go() {
	mkdir -p $HOME/gocode
	export GOPATH=$HOME/gocode
	go get -u github.com/axw/gocov/gocov
	go get -u github.com/vektra/mockery/.../
	go get -u github.com/stretchr/testify
}

# go test with coverage info using gocov
alias gotest='gocov test | gocov report'

# Alias for showing cgroups info with ps
alias psc='ps xawf -eo pid,user,cgroup,args'

