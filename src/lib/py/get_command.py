import sys
import json

def log(string:str):
    sys.stdout.write(string)

def main(pj_name:str, pj_dir:str):
    file = open(pj_dir + '/docker.env.json', 'r')
    text = file.read()
    file.close()
    docker_config = json.loads(text)
    log('sudo docker run -d -it ')

    if docker_config['env']:
        for key in docker_config['env']:
            log(f'-e {key}={docker_config['env'][key]} ')
    
    if docker_config['ports']:
        for key in docker_config['ports']:
            log(f'-p {key}:{docker_config['ports'][key]} ')

    log(f'--name {pj_name} {pj_name}:latest')

if __name__ == '__main__':
    main(sys.argv[2], sys.argv[1])
