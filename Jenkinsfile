#! groovy
@Library('roboshop-shared-library') _

def configMap = [
    application: "nodejsVM" ,
    component:"catalogue"
]

if (! env.BRANCH_NAME.equalsIgnoreCase('main')){
    piplineDecission.decidePipeline(configMap)
}
else{
    echo " This is production , deal with CR process "
}