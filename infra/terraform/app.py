from fastapi import FastAPI, Request
import time

app = FastAPI()

@app.get("/")
def root():
    return {"message": "FastAPI ML Inference API is live"}

@app.post("/predict")
async def predict(request: Request):
    payload = await request.json()
    time.sleep(0.5)  # simulate model latency
    return {
        "input": payload,
        "prediction": "cat",
        "confidence": 0.93
    }

