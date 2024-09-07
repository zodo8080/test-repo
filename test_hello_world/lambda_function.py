import uuid

def lambda_handler(event, context):
    # Generate a UUID
    unique_id = str(uuid.uuid4())
    
    # Your code logic here
    
    return {
        'statusCode': 200,
        'newvar': 'test104',
        'body': unique_id
    }
