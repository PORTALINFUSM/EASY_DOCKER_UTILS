import sys
import json

def log(string:str):
    sys.stdout.write(str(string))

def get_value(obj:dict, fields: list[str]):
    if fields[0] not in obj.keys():
        return
    
    if len(fields) == 1:
        log(obj[fields[0]])
    elif len(fields) > 1:
        get_value(obj[fields[0]], fields[1:])


def main(fields:str, pj_dir:str):
    file = open(pj_dir + '/docker.env.json', 'r')
    text = file.read()
    file.close()
    json_obj:dict = json.loads(text)

    get_value(json_obj, fields)

if __name__ == '__main__':
    main(sys.argv[2:], sys.argv[1])