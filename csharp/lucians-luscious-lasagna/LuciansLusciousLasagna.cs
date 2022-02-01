class Lasagna
{
    public int ExpectedMinutesInOven() => 40; 

    public int RemainingMinutesInOven(int timeInOven) => ExpectedMinutesInOven() - timeInOven;

    public int PreparationTimeInMinutes(int layers) => 2 * layers;

    public int ElapsedTimeInMinutes(int layersAdded, int timeInOven) => PreparationTimeInMinutes(layersAdded) + timeInOven;
}
