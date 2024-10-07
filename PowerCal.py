def calculate_mining_costs():
    """Calculates the power usage and associated costs for a mining rig.

    Prompts the user for input and returns the calculated values.
    """

    # Prompt the user for input
    watts = int(input("Enter the total wattage of the Rig: "))
    hours = int(input("How many hours did the RIG ran? [24]: "))
    rate = float(input("What is your electic rate? Price per kWh: "))

    # Calculate total kilowatt-hours (kWh)
    total_kwh = watts * hours / 1000

    # Calculate total cost
    total_cost = total_kwh * rate

    # Calculate cost per hour, day, week, and month
    cost_per_hour = watts * 1 / 1000 * rate
    cost_per_day = watts * 24 / 1000 * rate
    cost_per_week = watts * 24 * 7 / 1000 * rate
    cost_per_month = watts * 24 * 30 / 1000 * rate

    return {
        "total_kwh": total_kwh,
        "total_cost": total_cost,
        "cost_per_hour": cost_per_hour,
        "cost_per_day": cost_per_day,
        "cost_per_week": cost_per_week,
        "cost_per_month": cost_per_month
    }

# Example usage
results = calculate_mining_costs()

# Print the results
print("RIG Specks:")
print(f"Watts: \t{watts}")
print(f"kWh: \t{results['total_kwh']:.3f}")

print("\nThe RIG ran for ${hours}hrs and cost ${results['total_cost']:.2f} to mine.")

print("\nBelow are some additional figures  ")

print("*********************************")
print(f"*   Cost Per hour \t${results['cost_per_hour']:.2f} \t*\n")
print(f"*   Cost Per day \t${results['cost_per_day']:.2f} \t*\n")
print(f"*   Cost Per Week \t${results['cost_per_week']:.2f} \t*\n")
print(f"*   Cost Per Month \t${results['cost_per_month']:.2f} \t*\n")
print("*********************************")
print("\nNote the figures above excluding any taxes and fees.")
