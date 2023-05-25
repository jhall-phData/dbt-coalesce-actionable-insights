import requests
from requests.auth import HTTPBasicAuth
import os
import json
import time

# ------------------------------------------------------------------------------
# get environment variables
# ------------------------------------------------------------------------------
api_user     = os.environ['MATILLION_API_USER']     # error if no value, API username to connect to Matillion
api_pass     = os.environ['MATILLION_API_PASS']     # error if no value, API password to connect to Matillion
api_base     = os.environ['MATILLION_API_BASE']     # error if no value, base url to connect to
group_name   = os.environ['MATILLION_GROUP_NAME']   # error if no value, group name
project_name = os.environ['MATILLION_PROJECT_NAME'] # error if no value, project name
version_name = os.environ['MATILLION_VERSION_NAME'] # error if no value, version name
job_name     = os.environ['MATILLION_JOB_NAME']     # error if no value, job name
env_name     = os.environ['MATILLION_ENV_NAME']     # error if no value, env name

print(f"""
Configuration:
api_base: {api_base}
group_name: {group_name}
project_name: {project_name}
version_name: {version_name}
job_name: {job_name}
""")
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# use environment variables to set configuration
# ------------------------------------------------------------------------------
req_job_url = f'{api_base}/rest/v1/group/name/{group_name}/project/name/{project_name}/version/name/{version_name}/job/name/{job_name}/run?environmentName={env_name}'
req_task_status = f'{api_base}/rest/v1/group/name/{group_name}/project/name/{project_name}/task/id'
# ------------------------------------------------------------------------------

def run_job(url, user, user_pass) -> int:
    """
    Runs a Matillion Job
    """
    # build payload - can build a json to overload the grid variables

    # trigger job
    print(f'Triggering job:\n\turl: {url}')
    run_job_resp = requests.post(url, auth=HTTPBasicAuth(user, user_pass)).text
    print(f'Run Job Response: {run_job_resp}')
    json_resp = json.loads(run_job_resp)

    return json_resp['id']


def get_run_status(url, user, user_pass) -> str:
    """
    Requests a Matillion Task Status
    """
    # get status
    req_status_resp = requests.get(url, auth=HTTPBasicAuth(user, user_pass)).text
    print(f'Get Run Status Response: {req_status_resp}')
    json_resp = json.loads(req_status_resp)

    # return status
    return json_resp['state']


def main():
    print('Beginning request for job run...')

    # run job
    run_id: int = None
    try:
        run_id = run_job(req_job_url, api_user, api_pass)
    except Exception as e:
        print(f'ERROR! - Could not trigger job:\n {e}')
        raise

    # build status check url
    req_status_url = f'{req_task_status}/history'

    # check status indefinitely with an initial wait period
    time.sleep(30)
    while True:
        status = get_run_status(req_status_url, api_user, api_pass)
        print(f'Run status -> {status}')

        if status == 'FAILED':
            raise Exception(f'Run failed. See why in Matillion.')

        if status == 'SUCCESS':
            print(f'Job completed successfully!')
            return

        time.sleep(10)


if __name__ == "__main__":
    main()
