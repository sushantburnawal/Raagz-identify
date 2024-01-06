import streamlit as st
from audiorecorder import audiorecorder
import auto_chord

st.title("Identify your chords")
audio = audiorecorder("Click to record", "Click to stop recording")

if len(audio) > 0:
    # To play audio in frontend:
    st.audio(audio.export().read())  

    # To save audio to a file, use pydub export method:
    audio.export("test.wav", format="wav")
    
    x = auto_chord.recognize('test.wav')
    st.write(x)
else:
    st.warning('Audio was not recorded, pls try again')


