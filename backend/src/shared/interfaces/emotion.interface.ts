
export interface Emotion {
 id: number;
//  statistics_id: string;
 anger: number;
 concern: number;
 ease: number;
 frustration: number;
 happiness: number;
 heart: number;
 joy: number;
 proud: number;
 sadness: number;
 tiredness: number;
}

export interface EmotionRecord {
    id: number;
    // user_id: string;
    representitive_emoji: string;
    // emotion_id: string;
    selected_emoji: string;
    recordAt: Date;
    longitude: number;
    latitude: number;
    is_lock: boolean;

}