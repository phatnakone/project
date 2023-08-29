import React, { useEffect, useState } from 'react';
import './history.css';
import Navbar from '../navbar/Navbar';
import axios from 'axios';
import ClearIcon from '@mui/icons-material/Clear';
import Swal from 'sweetalert2';

interface PlayRecord {
  play_id: number;
  user_id: number;
  personality_id: number;
  play_date: string;
  play_time: string;
  like_selected: string;
  notlike_selected: string;
}

interface CardDescription {
  description_en: string | null;
  description_th: string | null;
}




interface PersonalityMapping {
  [key: number]: string;
}

const personalityMapping: PersonalityMapping = {
  1: 'กระทิง',
  2: 'หนู',
  3: 'หมี',
  4: 'เหยี่ยว',
};

function getPersonalityName(personalityId: number): string {
  return personalityMapping[personalityId] || 'Unknown';
}

async function fetchCardDescription(cardId: number): Promise<string> {
  try {
    const response = await axios.post('http://127.0.0.1:3007/card/byid', {
      card_id: cardId,
    });
    return response.data.data?.description_th || 'N/A';
  } catch (error) {
    console.error('Error fetching card description:', error);
    return 'N/A';
  }
}

function Historypage() {
  const [playHistory, setPlayHistory] = useState<PlayRecord[]>([]);
  const [cardDescriptions, setCardDescriptions] = useState<{ [playId: number]: { like_selected: string, notlike_selected: string } }>({});

  useEffect(() => {
    async function fetchData() {
      const userEmail = localStorage.getItem('userEmail');
      const userResponse = await axios.post('http://127.0.0.1:3007/get/id_user', {
        email: userEmail,
      });
      const userId = userResponse.data.user_id;
  
      try {
        const historyResponse = await axios.post('http://127.0.0.1:3007/get/history', {
          user_id: userId,
        });
  
        // Sort the play history by the play_date and play_time
        const sortedPlayHistory = historyResponse.data.playHistory.sort((a: { play_id: number; }, b: { play_id: number; }) => {
          return b.play_id - a.play_id;
        });
  
        setPlayHistory(sortedPlayHistory)
  
        const descriptions: { [playId: number]: { like_selected: string, notlike_selected: string } } = {};
  
        await Promise.all(
          sortedPlayHistory.map(async (play: { like_selected: string; notlike_selected: string; play_id: number; }) => {
            const likeDescriptions = await Promise.all(
              play.like_selected.split(' ').map(async (cardIdStr) => {
                const cardId = parseInt(cardIdStr, 10);
                return await fetchCardDescription(cardId);
              })
            );
  
            const notLikeDescriptions = await Promise.all(
              play.notlike_selected.split(' ').map(async (cardIdStr) => {
                const cardId = parseInt(cardIdStr, 10);
                return await fetchCardDescription(cardId);
              })
            );
  
            descriptions[play.play_id as number] = {
              like_selected: likeDescriptions.join(' |'),
              notlike_selected: notLikeDescriptions.join(' |'),
            };
          })
        );
  
        setCardDescriptions(descriptions);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    }
  
    fetchData();
  }, []);

  const handleDelete = async (playId: number) => {
    try {
      const response = await axios.delete('http://localhost:3007/delete/history', {
        data: {
          play_id: playId,
        },
      });
      
      if (response.status === 200) {
        // Play log was successfully deleted, update the UI accordingly
        Swal.fire({
          title: 'Are you sure?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
          if (result.isConfirmed) {
            Swal.fire(
              'Deleted!',
              'Your file has been deleted.',
              'success',  
            )
            setPlayHistory(prevPlayHistory => prevPlayHistory.filter(play => play.play_id !== playId));
          }
        })
        
      } else {
        console.error('Error deleting play log');
      }
    } catch (error) {
      console.error('Error deleting play log:', error);
    }
  };
  
  
  

const [description_th, setDescription_th] = useState('');
const [description_en, setDescription_en] = useState('');

//get description:
const [descriptions, setDescriptions] = useState<{ [playId: number]: { th: string; en: string } }>({});

useEffect(() => {
  playHistory.forEach((play) => {
    fetch(`http://127.0.0.1:3007/get/description`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ categoryId: play.personality_id })
    })
    .then((res) => res.json())
    .then((data) => {
      if (!data.error) {
        setDescriptions((prevDescriptions) => ({
          ...prevDescriptions,
          [play.play_id]: {
            th: data.description_th,
            en: data.description_en
          }
        }));
        console.log(data.description_th);
        console.log(data.description_en);
      }
    });
  });
}, [playHistory]);




  return (
    <div>
      <div>
        <Navbar />
      </div>
      {playHistory.map((play) => (
        <div className="box-history" key={play.play_id}>
          <h3>สิ่งที่เลือก 10 ข้อข้างล่างนี้ที่แทนความเป็นตัวคุณ</h3>
          <p className='des_th'>{cardDescriptions[play.play_id]?.like_selected}</p>
          <h3>สิ่งที่เลือก 5 ข้อข้างล่างนี้ที่ไม่ใช่ตัวคุณ</h3>
            <p className='des_th'>{cardDescriptions[play.play_id]?.notlike_selected}</p>
          <div className='re_sult'>
            <h3>ผลที่ได้</h3>
          <p className='des_th'>{descriptions[play.play_id]?.th}</p>
          </div>
          <div className="date-user">
            <br />
            <h5>
              {play.play_date} : {play.play_time}
            </h5>
          </div>
          <div className="text-history" key={play.play_id}></div>
          <div className="boximg-history">
            <img src={`/animal/${getPersonalityName(play.personality_id)}.jpg`} className="img-history" />
          </div>
          <button onClick={() => handleDelete(play.play_id)} className='btn_delete'>
            <ClearIcon />
          </button>
        </div>
      ))}
    </div>
  );
}

export default Historypage;


           
        // <hr />
        // <center>
        // <p>Play ID: {play.play_id}</p>
        // <p>User ID: {play.user_id}</p>
        // <p>Personality ID: {play.personality_id}</p>
        // <p>Play Date: {play.play_date}</p>
        // <p>Play Time: {play.play_time}</p>
        // <p>Liked Selected: {play.like_selected}</p>
        // <p>Not Liked Selected: {play.notlike_selected}</p>
        // </center>
        // <hr />