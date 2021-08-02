
export AWS_VAULT_BACKEND=pass
export PASSWORD_STORE_CLIP_TIME=14400

export MY_AWS_DEFAULT_SESSION_NAME=david.benjamin@spaceiq.com
export MY_AWS_DEFAULT_REGION=ap-southeast-2

#export AWS_SHARED_CREDENTIALS_FILE=$HOME/Downloads/credentials
export AWS_DEFAULT_REGION=$MY_AWS_DEFAULT_REGION

function aka() {
    SHORTCUTS=( 
        "svaudev|ap-southeast-2|arn:aws:iam::185535608991:role/SerraviewAUDEVAdministrator"

        "svauuat|ap-southeast-2|arn:aws:iam::937115396134:role/SerraviewAUUATAdministrator"
        "svcauat|ca-central-1|arn:aws:iam::660992603673:role/SerraviewCAUATAdministrator"
        "sveuuat|eu-central-1|arn:aws:iam::109690238165:role/SerraviewEUUATAdministrator"
        "svsguat|ap-southeast-1|arn:aws:iam::012544616412:role/SerraviewSGUATAdministrator"
        "svusuat|us-east-1|arn:aws:iam::571491466449:role/SerraviewUSUATAdministrator"
        "svuat|ap-southeast-2|arn:aws:iam::067577201041:role/SerraviewAdministrator"

        "svauprod|ap-southeast-2|arn:aws:iam::621300947463:role/SerraviewAUPRODAdministrator"
        "svcaprod|ca-central-1|arn:aws:iam::488215723008:role/SerraviewCAPRODAdministrator"
        "sveuprod|eu-central-1|arn:aws:iam::754007960328:role/SerraviewEUPRODAdministrator"
        "svsgprod|ap-southeast-1|arn:aws:iam::856137266173:role/SerraviewSGPRODAdministrator"
        "svusprod|us-east-1|arn:aws:iam::405992394724:role/SerraviewUSPRODAdministrator"
        "svprod|ap-southeast-2|arn:aws:iam::639282473425:role/SerraviewAdministrator"

        "archibusprod|us-east-1|arn:aws:iam::946135482630:role/SerraviewAdministrator"
        "archibusstaging|us-east-1|arn:aws:iam::347017926371:role/SerraviewAdministrator"
        "archibusprivatecloud|us-east-1|arn:aws:iam::485644745430:role/SerraviewAdministrator"

        "svsharedservices|ap-southeast-2|arn:aws:iam::192317691478:role/SerraviewAdministrator"

        "svaubilling|ap-southeast-2|arn:aws:iam::633730919904:role/SerraviewAdministrator"
        "svauofc|ap-southeast-2|arn:aws:iam::881522978900:role/SerraviewAUOFFICEAdministrator"
        "svusoffice|us-east-1|arn:aws:iam::512101511498:role/SerraviewUSOFFICEAdministrator"
    )
    new_id=$@
    new_region=$AWS_DEFAULT_REGION
    for s in "${SHORTCUTS[@]}" ; do
        if [ "$@" = "${s%%|*}" ]; then
            new_id="${s##*|}"
            new_region=`expr $s : ".*|\(.*\)|.*"`
        fi
    done
    temp_role=$(aws sts assume-role --role-arn $new_id --role-session-name $MY_AWS_DEFAULT_SESSION_NAME)
    echo "[default]" > ~/.aws/credentials
    echo aws_access_key_id = $(echo $temp_role | jq .Credentials.AccessKeyId | xargs) >> ~/.aws/credentials
    echo aws_secret_access_key = $(echo $temp_role | jq .Credentials.SecretAccessKey | xargs) >> ~/.aws/credentials
    echo aws_session_token = $(echo $temp_role | jq .Credentials.SessionToken | xargs) >> ~/.aws/credentials
    unset AWS_SHARED_CREDENTIALS_FILE
    export AWS_DEFAULT_REGION=$new_region
    aws sts get-caller-identity
}

function naka() {
    export AWS_SHARED_CREDENTIALS_FILE=$HOME/Downloads/credentials
    export AWS_DEFAULT_REGION=$MY_AWS_DEFAULT_REGION
    aws sts get-caller-identity
}
