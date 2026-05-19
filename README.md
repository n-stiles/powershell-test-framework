# powershell-test-framework
A PowerShell testing framework designed to support Test-Driven Development (TDD) practices for scripting, automation, and infrastructure validation. (While I'm learning :) )

<!-- TABLE OF CONTENTS -->
## Table of Contents
<details>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li>Installation</li>
      </ul>
    </li>
    <li><a href="#version info">Usage</a></li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## Getting Started

This is a shared testing framework for powershell scripts that is responsible for:  
  
Creating project structure  
Creating test structure  
Providing generic test utilities  
Enforcing unit/integration separation  
Enforcing “no unmocked infrastructure”  
Providing pluggable mock hooks  


### Installation

To install the module locally for repeated use:  
  
  1. Clone the Git repository  
  2. Register a local PowerShell repository (one-time setup)  
  3. Publish the module to the local repository  
  4. Install and import the module  
  
One-Time Repository Setup

Create a local repository folder:

```
New-Item -Path C:\MyLocalRepo -ItemType Directory
```

```
Register-PSRepository `
    -Name MyLocalRepo `
    -SourceLocation C:\MyLocalRepo `
    -PublishLocation C:\MyLocalRepo `
    -InstallationPolicy Trusted
```

Publish the Module  

The module source is located under src to support multiple modules within the same repository.  

Publish the module to the local repository:  

```
Publish-Module `
    -Path "PATHTOPROJECT\powershell-test-framework\src\powershell-test-framework" `
    -Repository MyLocalRepoepository MyLocalRepo
```

This should create C:\MyLocalRepo\
    project-test-framework.1.0.0.nupkg

Verify 
```
Find-Module -Repository MyLocalRepo
```

```
Install-Module `
    -Name powershell-test-framework `
    -Repository MyLocalRepo `
    -Scope CurrentUser
```

```
Import-Module powershell-test-framework
```

### In lieu of installing the module, you can also copy the Public and Private folders to your project  
### and dot source the Use-NewSqlFixture.ps1 script in your test files.

1. clone the repo 
1. Copy the public/private folders and Use-NewSqlFixture.ps1 to Tools/New.SqlFixture/ in your project

Run 
```
. .\Tools\Use-NewProjectFixture.ps1
```

1. Use normally 
```
New-NewProjectFixture  Foo
New-NewProjectFixture AnotherScript
```

5. Add the following lines to Unit tests 
```


$fixtureRoot = Join-Path $PSScriptRoot '..\..\Tools\New.ProjectFixture'

. "$fixtureRoot\Public\Initialize-TestEnvironment.ps1"
Initialize-TestEnvironment


```

<!-- USAGE EXAMPLES -->
## Usage

 ### The Preferred Method using the Enterprise GitHub Repo and an IDE



<p align="right"><a href="#table-of-contents">back to top</a></p>

<!-- TESTING -->
## Testing

[Pester](https://pester.dev/)  is the framework used for these powershell scripts


####  Standards  
1. One test file of each type per script/module
1. Naming Convention for tests  
   *.Unit.Tests.ps1  
   *.Integration.Tests.ps1 

>  [!IMPORTANT]  
> 1. Functions must be dot‑sourced by the test file itself.  
> 1. Framework code may only locate paths, not load SUT code. 

--  Tests\TestBootstrap.ps1  
1. Establish's execution context 
2. Resolve path for testing 
1. Load the System Under Test (SUT)
1. Import shared helpers
1. Set test defaults

-- Tests\Helpers\CommonMocks.ps1  
1. Helpers for the unit tests  


### Testing Framework Information
To create a new test project with default Unit and Integration tests run

``` 
New-SqlFixture ScriptName
```  

To create a Unit test only 

```
New-UnitTest TestName
```

To create an Integration test only 
```
New-IntegrationTest TestName
```

At the top of every unit test created include these lines
```
Import-Module PowerShell.SqlFixture -ErrorAction Stop
Initialize-TestEnvironment
```

> ## IMPORTANT  
> This does not use Pester’s New‑Fixture, it's a custom scaffolding function   
> All scripts and tests must be scaffolded using New‑ProjectFixture.


## Running unit tests (CI pipeline)

To execute a test from the Scripts folder

```
Invoke-Pester -Path Tests\Unit
```

## Running integration tests

```
Invoke-Pester Tests\Integration
```

To run tests without the .Tests.ps1 extension use 

```
Invoke-Pester -Script Tests\Test-ScriptWithPesterTest.ps1
```


## Running end-to-end tests

For end-to-end (e2e) testing, run:

```
Invoke-Pester
```


<!-- ROADMAP -->
## Roadmap
- [x] Add README
- [ ] Add Framework scaffolding
- [ ] Add Testing Readme 
- [ ] Add a test example
- [ ] Add testing framework v2 
- [ ] Upgrade to Pester 5

<p align="right"><a href="#table-of-contents">back to top</a></p>

<!-- Version Info -->
## Version Info

#### 1.0.0 (May 14, 2026)

- Initial Wiring of the framework module


#### Previous

This changelog is inspired by the
[Pester]https://github.com/pester/Pester/blob/main/docs/CHANGELOG.md) file.
keeping it tidy and understandable.

<p align="right"><a href="#table-of-contents">back to top</a></p>

<!-- CONTACT -->
## Contact

stileslab@outlook.com


<p align="right"><a href="#table-of-contents">back to top</a></p>

