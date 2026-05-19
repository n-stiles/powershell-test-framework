function Assert-NoUnmockedInfrastructure {

    # OS / CIM
    Mock Get-CimInstance {
        throw 'UNMOCKED Get-CimInstance call. Unit tests must explicitly mock infrastructure.'
    }

    # SQL
    Mock Invoke-Sqlcmd {
        throw 'UNMOCKED Invoke-Sqlcmd call. SQL access is not allowed in unit tests.'
    }

    # Network
    Mock Test-Connection {
        throw 'UNMOCKED Test-Connection call. Network access must be mocked.'
    }

    # Remoting
    Mock Invoke-Command {
        throw 'UNMOCKED Invoke-Command call. Integration behavior is not allowed in unit tests.'
    }
}